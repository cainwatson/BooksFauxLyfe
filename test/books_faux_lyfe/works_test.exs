defmodule BooksFauxLyfe.WorksTest do
  use BooksFauxLyfe.DataCase

  alias BooksFauxLyfe.Works

  describe "books" do
    alias BooksFauxLyfe.Works.Book

    @valid_attrs %{date_published: ~D[2010-04-17], edition: "some edition", isbn: "some isbn", tititle: "some tititle"}
    @update_attrs %{date_published: ~D[2011-05-18], edition: "some updated edition", isbn: "some updated isbn", tititle: "some updated tititle"}
    @invalid_attrs %{date_published: nil, edition: nil, isbn: nil, tititle: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Works.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Works.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Works.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Works.create_book(@valid_attrs)
      assert book.date_published == ~D[2010-04-17]
      assert book.edition == "some edition"
      assert book.isbn == "some isbn"
      assert book.tititle == "some tititle"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Works.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Works.update_book(book, @update_attrs)
      assert book.date_published == ~D[2011-05-18]
      assert book.edition == "some updated edition"
      assert book.isbn == "some updated isbn"
      assert book.tititle == "some updated tititle"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Works.update_book(book, @invalid_attrs)
      assert book == Works.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Works.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Works.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Works.change_book(book)
    end
  end
end
