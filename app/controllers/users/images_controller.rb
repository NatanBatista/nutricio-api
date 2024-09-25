class Users::ImagesController < ApplicationController
    before_action :authenticate_user! # Certifique-se de que o usuário esteja autenticado

    def update
      # Busca o usuário atual e anexa a imagem enviada via params
      if current_user.update(image_params)
        render json: { message: 'Image uploaded successfully', image_url: url_for(current_user.image) }, status: :ok
      else
        render json: { error: 'Failed to upload image' }, status: :unprocessable_entity
      end
    end

    private

    def image_params
      params.require(:user).permit(:image)
    end
end
