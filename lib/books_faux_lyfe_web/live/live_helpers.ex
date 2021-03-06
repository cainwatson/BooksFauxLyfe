defmodule BooksFauxLyfeWeb.LiveHelpers do
  @moduledoc false

  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `BooksFauxLyfeWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, BooksFauxLyfeWeb.BookLive.FormComponent,
        id: @book.id || :new,
        action: @live_action,
        book: @book,
        return_to: Routes.book_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, BooksFauxLyfeWeb.ModalComponent, modal_opts)
  end
end
