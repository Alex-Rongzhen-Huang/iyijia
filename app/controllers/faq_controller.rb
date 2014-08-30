class FaqController < ApplicationController
  def index
    @faq_items = FaqItem.order('weight DESC')
  end
end
