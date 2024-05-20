class HamburguesasController < ApplicationController
    def index
        @hamburguesas = Hamburguesa.all
        render json: @hamburguesas
    end

    def create
        @hamburguesa = Hamburguesa.new(hamburguesa_params)
        if @hamburguesa.save
            render json: @hamburguesa, status: :created
        else
            render json: @hamburguesa.errors, status: :unprocessable_entity
        end
    end

    def update
        @hamburguesa = Hamburguesa.find(params[:id])
        if @hamburguesa.update(hamburguesa_params)
            render json: @hamburguesa, status: :ok
        else
            render json: @hamburguesa.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @hamburguesa = Hamburguesa.find(params[:id])
        if @hamburguesa.destroy
            head :ok
        else
            render json: {error: "Failed to delete"}, status: :unprocessable_entity
        end
    end

    private

    def hamburguesa_params
        params.require(:hamburguesa).permit(:nombre, :tomate, :quesoCabra, :cebolla, :pepinillos, :bacon, :carne, :precio, :pedido_id)
    end
end
