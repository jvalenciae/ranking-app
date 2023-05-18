class RankingsController < ApplicationController
  def actual
    @users = User.includes(:rankings).sort_by(&:total_distance_traveled).reverse
    @users = Kaminari.paginate_array(@users).page(params[:page])

    render 'rankings/index'
  end
end
