module Api
    module V1
      class ReviewsController < ApplicationController
        protect_from_forgery with: :null_session

        # Método para crear una nueva reseña
        def create
          review = Review.new(review_params)
          
          # Si la reseña se guarda exitosamente, renderizamos la reseña en formato JSON
          if review.save
            render json: ReviewSerializer.new(review).serialized_json
          # Si hay errores al guardar la reseña, mostramos los mensajes de error en la consola
          else
            puts review.errors.full_messages
            render json: { error: review.errors.messages }, status: 422
          end
        end
        # Método para eliminar una reseña
        def destroy
          review = Review.find(params[:id])
  
          if review.destroy
            head :no_content
          else
            render json: { error: review.errors.messages }, status: 422
          end
        end
  
        private
        # Método para definir los parámetros permitidos para crear una reseña
        def review_params
          params.require(:review).permit(:title, :description, :score, :lenguaje_id)
        end
      end
    end
  end
  