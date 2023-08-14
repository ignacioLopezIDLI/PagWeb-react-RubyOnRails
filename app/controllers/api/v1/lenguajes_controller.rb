module Api
    module V1
        class LenguajesController < ApplicationController
            def index
                lenguajes = Lenguaje.all

                render json: LenguajeSerializer.new(lenguajes, options).serialized_json
        end

        def show
            lenguaje = Lenguaje.find_by(slug: params[:slug])

            render json: LenguajeSerializer.new(lenguaje, options).serialized_json
        end

        def create
             lenguaje = Lenguaje.new(lenguaje_params)

          if lenguaje.save
            render json: LenguajeSerializer.new(lenguaje).serialized_json
          else
            render json: {error: lenguaje.error.messages }, status:422
          end
        end

        def update
            lenguaje = Lenguaje.find_by(slug: params[:slug])

         if lenguaje.update(lenguaje_params)
           render json: LenguajeSerializer.new(lenguaje, options).serialized_json
         else
           render json: {error: lenguaje.error.messages }, status:422
         end
       end

       def destroy
        lenguaje = Lenguaje.find_by(slug: params[:slug])

        if lenguaje.destroy(lenguaje_params)
            head :no_content
        else
        render json: {error: lenguaje.error.messages }, status:422
        end
    end

        private

        def lenguaje_params
            params.require(:lenguaje).permit(:name, :image_url)
        end

        def options
            @options ||= { include: ['reviews'] }
        end
     end
    end
end