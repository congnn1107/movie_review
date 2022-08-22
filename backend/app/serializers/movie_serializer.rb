class MovieSerializer < ApplicationSerializer
  attributes :poster, :name, :slug, :premiere_at, :describe

  def poster
    rails_blob_url(object.poster, only_path: true) if object.poster.attached?
  end

  def premiere_at
    object.premiere_at.strftime('%d-%m-%Y')
  end
end
