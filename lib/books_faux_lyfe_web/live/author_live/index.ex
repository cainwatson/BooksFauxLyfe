defmodule BooksFauxLyfeWeb.AuthorLive.Index do
  use BooksFauxLyfeWeb, :live_view

  alias BooksFauxLyfe.Works
  alias BooksFauxLyfe.Works.Author

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :authors, list_authors())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Author")
    |> assign(:author, Works.get_author!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Author")
    |> assign(:author, %Author{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Authors")
    |> assign(:author, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    author = Works.get_author!(id)
    {:ok, _} = Works.delete_author(author)

    {:noreply, assign(socket, :authors, list_authors())}
  end

  defp list_authors do
    Works.list_authors()
  end
end
