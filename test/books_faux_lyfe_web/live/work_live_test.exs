defmodule BooksFauxLyfeWeb.WorkLiveTest do
  use BooksFauxLyfeWeb.ConnCase

  import Phoenix.LiveViewTest

  alias BooksFauxLyfe.Works

  @create_attrs %{languages: ["en"], subtitle: "some subtitle", title: "some title"}
  @update_attrs %{languages: [], subtitle: "some updated subtitle", title: "some updated title"}
  @invalid_attrs %{languages: [], subtitle: nil, title: nil}

  defp fixture(:work) do
    {:ok, work} = Works.create_work(@create_attrs)
    work
  end

  defp create_work(_) do
    work = fixture(:work)
    %{work: work}
  end

  describe "Index" do
    setup [:create_work]

    test "lists all works", %{conn: conn, work: work} do
      {:ok, _index_live, html} = live(conn, Routes.work_index_path(conn, :index))

      assert html =~ "Listing Works"
      assert html =~ work.title
    end

    test "saves new work", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.work_index_path(conn, :index))

      assert index_live |> element("a", "New Work") |> render_click() =~
               "New Work"

      assert_patch(index_live, Routes.work_index_path(conn, :new))

      assert index_live
             |> form("#work-form", work: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#work-form", work: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.work_index_path(conn, :index))

      assert html =~ "Work created successfully"
      assert html =~ "some title"
    end

    test "updates work in listing", %{conn: conn, work: work} do
      {:ok, index_live, _html} = live(conn, Routes.work_index_path(conn, :index))

      assert index_live |> element("#work-#{work.id} a", "Edit") |> render_click() =~
               "Edit Work"

      assert_patch(index_live, Routes.work_index_path(conn, :edit, work))

      assert index_live
             |> form("#work-form", work: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#work-form", work: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.work_index_path(conn, :index))

      assert html =~ "Work updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes work in listing", %{conn: conn, work: work} do
      {:ok, index_live, _html} = live(conn, Routes.work_index_path(conn, :index))

      assert index_live |> element("#work-#{work.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#work-#{work.id}")
    end
  end

  describe "Show" do
    setup [:create_work]

    test "displays work", %{conn: conn, work: work} do
      {:ok, _show_live, html} = live(conn, Routes.work_show_path(conn, :show, work))

      assert html =~ "Show Work"
      assert html =~ work.title
    end

    test "updates work within modal", %{conn: conn, work: work} do
      {:ok, show_live, _html} = live(conn, Routes.work_show_path(conn, :show, work))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Work"

      assert_patch(show_live, Routes.work_show_path(conn, :edit, work))

      assert show_live
             |> form("#work-form", work: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#work-form", work: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.work_show_path(conn, :show, work))

      assert html =~ "Work updated successfully"
      assert html =~ "some updated title"
    end
  end
end
