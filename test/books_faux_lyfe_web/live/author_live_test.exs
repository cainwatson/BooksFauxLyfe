defmodule BooksFauxLyfeWeb.AuthorLiveTest do
  use BooksFauxLyfeWeb.ConnCase

  import Phoenix.LiveViewTest

  alias BooksFauxLyfe.Works

  @create_attrs %{
    bio: "some bio",
    date_death: ~D[2010-04-17],
    dob: ~D[2010-04-17],
    name: "some name"
  }
  @update_attrs %{
    bio: "some updated bio",
    date_death: ~D[2011-05-18],
    dob: ~D[2011-05-18],
    name: "some updated name"
  }
  @invalid_attrs %{
    bio: nil,
    date_death: nil,
    dob: nil,
    name: nil
  }

  defp fixture(:author) do
    {:ok, author} = Works.create_author(@create_attrs)
    author
  end

  defp create_author(_) do
    author = fixture(:author)
    %{author: author}
  end

  describe "Index" do
    setup [:create_author]

    test "lists all authors", %{conn: conn, author: author} do
      {:ok, _index_live, html} = live(conn, Routes.author_index_path(conn, :index))

      assert html =~ "Listing Authors"
      assert html =~ author.bio
    end

    test "saves new author", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.author_index_path(conn, :index))

      assert index_live |> element("a", "New Author") |> render_click() =~
               "New Author"

      assert_patch(index_live, Routes.author_index_path(conn, :new))

      assert index_live
             |> form("#author-form", author: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#author-form", author: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.author_index_path(conn, :index))

      assert html =~ "Author created successfully"
      assert html =~ "some bio"
    end

    test "updates author in listing", %{conn: conn, author: author} do
      {:ok, index_live, _html} = live(conn, Routes.author_index_path(conn, :index))

      assert index_live |> element("#author-#{author.id} a", "Edit") |> render_click() =~
               "Edit Author"

      assert_patch(index_live, Routes.author_index_path(conn, :edit, author))

      assert index_live
             |> form("#author-form", author: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#author-form", author: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.author_index_path(conn, :index))

      assert html =~ "Author updated successfully"
      assert html =~ "some updated bio"
    end

    test "deletes author in listing", %{conn: conn, author: author} do
      {:ok, index_live, _html} = live(conn, Routes.author_index_path(conn, :index))

      assert index_live |> element("#author-#{author.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#author-#{author.id}")
    end
  end

  describe "Show" do
    setup [:create_author]

    test "displays author", %{conn: conn, author: author} do
      {:ok, _show_live, html} = live(conn, Routes.author_show_path(conn, :show, author))

      assert html =~ "Show Author"
      assert html =~ author.bio
    end

    test "updates author within modal", %{conn: conn, author: author} do
      {:ok, show_live, _html} = live(conn, Routes.author_show_path(conn, :show, author))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Author"

      assert_patch(show_live, Routes.author_show_path(conn, :edit, author))

      assert show_live
             |> form("#author-form", author: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#author-form", author: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.author_show_path(conn, :show, author))

      assert html =~ "Author updated successfully"
      assert html =~ "some updated bio"
    end
  end
end
