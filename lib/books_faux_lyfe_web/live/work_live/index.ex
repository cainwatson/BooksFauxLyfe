defmodule BooksFauxLyfeWeb.WorkLive.Index do
  use BooksFauxLyfeWeb, :live_view

  alias BooksFauxLyfe.Works
  alias BooksFauxLyfe.Works.Work

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :works, list_works())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Work")
    |> assign(:work, Works.get_work!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Work")
    |> assign(:work, %Work{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Works")
    |> assign(:work, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    work = Works.get_work!(id)
    {:ok, _} = Works.delete_work(work)

    {:noreply, assign(socket, :works, list_works())}
  end

  defp list_works do
    Works.list_works()
  end
end
