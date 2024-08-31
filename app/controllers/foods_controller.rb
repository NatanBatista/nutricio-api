class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :destroy]

  def index
    @foods = Food.all
    render json: @foods, include: :nutricional_value
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