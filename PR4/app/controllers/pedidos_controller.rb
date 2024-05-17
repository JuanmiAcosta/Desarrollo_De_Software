class PedidosController < ApplicationController
    def index
        @pedidos = Pedido.where(usuario: params[:usuario])
        logger.info "Cargando pedidos para el usuario #{params[:usuario]}"
        render json: @pedidos
    end

    def create
        @pedido = Pedido.new(pedido_params)
        if @pedido.save
            render json: @pedido, status: :created
        else
            render json: @pedido.errors, status: :unprocessable_entity
        end
    end

    def update
        @pedido = Pedido.find(params[:id])
        if @pedido.update(pedido_params)
            render json: @pedido, status: :ok
        else
            render json: @pedido.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @pedido = Pedido.find(params[:id])
        if @pedido.destroy
            head :ok
        else
            render json: {error: "Failed to delete"}, status: :unprocessable_entity
        end
    end

    private

    def pedido_params
        params.require(:pedido).permit(:idPedido, :precio, :listo, :usuario)
    end
end
