defmodule BooksFauxLyfe.WorksTest do
  use BooksFauxLyfe.DataCase

  alias BooksFauxLyfe.Works

  describe "books" do
    alias BooksFauxLyfe.Works.Book

    @valid_attrs %{
      date_published: ~D[2010-04-17],
      edition: "some edition",
      isbn: "some isbn",
      tititle: "some tititle"
    }
    @update_attrs %{
      date_published: ~D[2011-05-18],
      edition: "some updated edition",
      isbn: "some updated isbn",
      tititle: "some updated tititle"
    }
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

  describe "authors" do
    alias BooksFauxLyfe.Works.Author

    @valid_attrs %{
      bio: "some bio",
      date_death: ~D[2010-04-17],
      dob: ~D[2010-04-17],
      name_first: "some name_first",
      name_last: "some name_last",
      name_middle: "some name_middle"
    }
    @update_attrs %{
      bio: "some updated bio",
      date_death: ~D[2011-05-18],
      dob: ~D[2011-05-18],
      name_first: "some updated name_first",
      name_last: "some updated name_last",
      name_middle: "some updated name_middle"
    }
    @invalid_attrs %{
      bio: nil,
      date_death: nil,
      dob: nil,
      name_first: nil,
      name_last: nil,
      name_middle: nil
    }

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Works.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Works.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Works.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Works.create_author(@valid_attrs)
      assert author.bio == "some bio"
      assert author.date_death == ~D[2010-04-17]
      assert author.dob == ~D[2010-04-17]
      assert author.name_first == "some name_first"
      assert author.name_last == "some name_last"
      assert author.name_middle == "some name_middle"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Works.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Works.update_author(author, @update_attrs)
      assert author.bio == "some updated bio"
      assert author.date_death == ~D[2011-05-18]
      assert author.dob == ~D[2011-05-18]
      assert author.name_first == "some updated name_first"
      assert author.name_last == "some updated name_last"
      assert author.name_middle == "some updated name_middle"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Works.update_author(author, @invalid_attrs)
      assert author == Works.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Works.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Works.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Works.change_author(author)
    end
  end

  describe "works" do
    alias BooksFauxLyfe.Works.Work

    @valid_attrs %{languages: [], subtitle: "some subtitle", title: "some title"}
    @update_attrs %{languages: [], subtitle: "some updated subtitle", title: "some updated title"}
    @invalid_attrs %{languages: nil, subtitle: nil, title: nil}

    def work_fixture(attrs \\ %{}) do
      {:ok, work} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Works.create_work()

      work
    end

    test "list_works/0 returns all works" do
      work = work_fixture()
      assert Works.list_works() == [work]
    end

    test "get_work!/1 returns the work with given id" do
      work = work_fixture()
      assert Works.get_work!(work.id) == work
    end

    test "create_work/1 with valid data creates a work" do
      assert {:ok, %Work{} = work} = Works.create_work(@valid_attrs)
      assert work.languages == []
      assert work.subtitle == "some subtitle"
      assert work.title == "some title"
    end

    test "create_work/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Works.create_work(@invalid_attrs)
    end

    test "update_work/2 with valid data updates the work" do
      work = work_fixture()
      assert {:ok, %Work{} = work} = Works.update_work(work, @update_attrs)
      assert work.languages == []
      assert work.subtitle == "some updated subtitle"
      assert work.title == "some updated title"
    end

    test "update_work/2 with invalid data returns error changeset" do
      work = work_fixture()
      assert {:error, %Ecto.Changeset{}} = Works.update_work(work, @invalid_attrs)
      assert work == Works.get_work!(work.id)
    end

    test "delete_work/1 deletes the work" do
      work = work_fixture()
      assert {:ok, %Work{}} = Works.delete_work(work)
      assert_raise Ecto.NoResultsError, fn -> Works.get_work!(work.id) end
    end

    test "change_work/1 returns a work changeset" do
      work = work_fixture()
      assert %Ecto.Changeset{} = Works.change_work(work)
    end
  end
end
