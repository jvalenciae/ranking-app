class RankingsController < ApplicationController
  def actual
    @users = User.includes(:rankings).sort_by(&:total_distance_traveled).reverse
    @users = Kaminari.paginate_array(@users).page(params[:page])

    render 'rankings/index'
  end

  def by_month
    @users = User.ranking_by_month_and_year(params[:month], params[:year])
    @users = Kaminari.paginate_array(@users).page(params[:page])

    render 'rankings/by_month'
  end

  def record
    user = User.find_by(id: params[:user_id])
    distance_traveled = params[:distance_traveled]

    render json: { errors: 'User not found' }, status: :not_found and return unless user

    @ranking = Ranking.find_or_initialize_by(month: Time.zone.now.month, year: Time.zone.now.year, user: user)
    @ranking.distance_traveled = distance_traveled

    if @ranking.save
      render 'rankings/record'
    else
      render json: { errors: @ranking.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
