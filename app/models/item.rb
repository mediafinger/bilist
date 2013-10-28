class Item < ActiveRecord::Base

  validates :sorting, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
  validates :source,  presence: true

  scope :by_done,     -> { order('done ASC') }
  scope :by_sorting,  -> { order('sorting ASC') }
  scope :by_source,   -> { order('source ASC') }

  def translation
    self.source.reverse

    # TODO query Google Translate:
    #   https://translate.google.com/#de/es/Klob%C3%BCrste
    # read translated text out from
    #   <span id="result_box" class="short_text" lang="es"><span class="hps">escobilla de baño</span></span>
  end

end
