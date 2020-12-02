defmodule BooksFauxLyfeWeb.BookLive.Index do
  @moduledoc false

  use BooksFauxLyfeWeb, :live_view

  alias BooksFauxLyfe.Works
  alias BooksFauxLyfe.Works.Book

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :books, list_books())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book")
    |> assign(:book, Works.get_book!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book")
    |> assign(:book, %Book{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Books")
    |> assign(:book, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book = Works.get_book!(id)
    {:ok, _} = Works.delete_book(book)

    {:noreply, assign(socket, :books, list_books())}
  end

  defp list_books do
    Works.list_books()
  end
end
