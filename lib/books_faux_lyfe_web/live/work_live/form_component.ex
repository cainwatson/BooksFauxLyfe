defmodule BooksFauxLyfeWeb.WorkLive.FormComponent do
  @moduledoc false

  use BooksFauxLyfeWeb, :live_component

  alias BooksFauxLyfe.Works

  @impl true
  def update(%{work: work} = assigns, socket) do
    changeset = Works.change_work(work)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"work" => work_params}, socket) do
    changeset =
      socket.assigns.work
      |> Works.change_work(work_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"work" => work_params}, socket) do
    save_work(socket, socket.assigns.action, work_params)
  end

  defp save_work(socket, :edit, work_params) do
    case Works.update_work(socket.assigns.work, work_params) do
      {:ok, _work} ->
        {:noreply,
         socket
         |> put_flash(:info, "Work updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_work(socket, :new, work_params) do
    case Works.create_work(work_params) do
      {:ok, _work} ->
        {:noreply,
         socket
         |> put_flash(:info, "Work created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
