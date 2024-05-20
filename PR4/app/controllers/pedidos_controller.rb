class PedidosController < ApplicationController
    def index

        @pedidos = Pedido.joins(:hamburguesas).where(usuario: params[:usuario]).limit(1)
        logger.info "Cargando pedidos para el usuario #{params[:usuario]}"
        render json: @pedidos.as_json(include: :hamburguesas) #tb de ven las hamburguesas
    end

    def create
        logger.debug "Received params: #{params.inspect}"
        @pedido = Pedido.new(pedido_params.except(:hamburguesas))
        if @pedido.save
            hamburguesas = []
            errores = []
            pedido_params[:hamburguesas].each do |hamburguesa_params|
                @hamburguesa = Hamburguesa.new(hamburguesa_params)
                @hamburguesa.pedido_id = @pedido.id
                if @hamburguesa.save
                    hamburguesas << @hamburguesa
                else
                    errores << @hamburguesa.errors
                end
            end
            if errores.empty?
                render json: @pedido, status: :created
            else
                render json: errores, status: :unprocessable_entity
            end
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
        params.require(:pedido).permit(:idPedido, :precio, :listo, :usuario, hamburguesas: [:pan, :lechuga, :nombre, :tomate, :quesoCabra, :cebolla, :pepinillos, :bacon, :carne, :precio])
    end

    def hamburguesa_params
        params.require(:hamburguesa).permit(:pan, :lechuga, :nombre, :tomate, :quesoCabra, :cebolla, :pepinillos, :bacon, :carne, :precio, :pedido_id)
    end
end
