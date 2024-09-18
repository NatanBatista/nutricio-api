class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: [:show, :update, :destroy]

  def index
    @foods = Food.page(params[:page]).per(10)
    render json: {
      foods: @foods.as_json(include: :nutricional_value),
      meta: {
        current_page: @foods.current_page,
        total_pages: @foods.total_pages,
        total_count: @foods.total_count
      }
    }
  end

  def show
    render json: @food, include: :nutricional_value
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      render json: @food, status: :created, include: :nutricional_value
    else
      render json: { errors: @food.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      render json: @food, include: :nutricional_value
    else
      render json: { errors: @food.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    head :no_content
  end

  def bulk_destroy
    ids = params[:ids]
    if ids.present?
      Food.where(id: ids).destroy_all
      head :no_content
    else
      render json: { errors: 'No IDs provided' }, status: :unprocessable_entity
    end
  end
  
  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(
      :name, :table, :scientific_name, :code,
      nutricional_value_attributes: [
        :protein, :total_carbohydrate, :lipids, :dietary_fiber, :energy_kcal,
        :vitamin_a, :vitamin_c, :thiamine, :niacin, :vitamin_b6, :phosphorus,
        :iron, :sodium, :potassium, :calcium, :magnesium, :manganese, :copper, :zinc
      ]
    )
  end
end