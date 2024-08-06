class Disciplina < ApplicationRecord
  belongs_to :periodo
  has_many :avaliacaos
  has_many :topicos, dependent: :destroy
  accepts_nested_attributes_for :topicos, allow_destroy: true, reject_if: ->(attrs) { attrs['nome'].blank? }

  @media

  def set_media(media)
    @media = media
  end

  def get_media
    @media.round(2)
  end
  
  validates :nome, presence: true
  validates :carga_horaria, presence: true
  validates :creditos, presence: true
  validates :faltas, presence: true
end