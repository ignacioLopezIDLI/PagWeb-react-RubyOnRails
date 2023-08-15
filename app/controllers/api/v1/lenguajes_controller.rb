module Api
    module V1
        class LenguajesController < ApplicationController
            protect_from_forgery with: :null_session
            # INDEX Obtiene Todos los Lenguajes -> Serializer Convierte a Json
            def index
                lenguajes = Lenguaje.all

                render json: LenguajeSerializer.new(lenguajes, options).serialized_json
        end
            # SHOW Obtiene x slug
        def show
            lenguaje = Lenguaje.find_by(slug: params[:slug])

            render json: LenguajeSerializer.new(lenguaje, options).serialized_json
        end
            # CREATE Crea un nuevo Lenguaje usando name  y image_url
        def create
             lenguaje = Lenguaje.new(lenguaje_params)

          if lenguaje.save
            render json: LenguajeSerializer.new(lenguaje).serialized_json
          else
            render json: {error: lenguaje.error.messages }, status:422
          end
        end
            # UPDATE Busca lenguaje x slug -> Actualiza name y img_url
        def update
            lenguaje = Lenguaje.find_by(slug: params[:slug])

         if lenguaje.update(lenguaje_params)
           render json: LenguajeSerializer.new(lenguaje, options).serialized_json
         else
           render json: {error: lenguaje.error.messages }, status:422
         end
       end
            # DESTROY Busca lenguaje x slug -> operacion exitosa "No content"
            def destroy
                lenguaje = Lenguaje.find_by(slug: params[:slug])
              
                if lenguaje.destroy
                  render json: { message: "Lenguaje eliminado exitosamente" }, status: 200
                else
                  render json: { error: lenguaje.errors.full_messages }, status: 422
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