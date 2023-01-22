class ItemsController < ApplicationController
  def search
    if item_params.present?
      @items = RakutenWebService::Ichiba::Item.search(keyword: item_params)
    end
  end

  def item_params
    params[:keyword]
  end
end
