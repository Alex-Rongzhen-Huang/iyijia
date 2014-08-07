class FaqController < ApplicationController
  def index
    @faq_items = FaqItem.all
  end
end
