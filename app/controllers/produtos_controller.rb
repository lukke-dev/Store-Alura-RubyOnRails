class ProdutosController < ApplicationController
  def index
    @produtos = Produto.order(nome: :desc).limit 5
    @prod_desc = Produto.order(:preco).limit(1)
  end

  def new
    @produto = Produto.new
  end

  def create
    @produto = Produto.new(produto_params)
    if @produto.save
      flash[:notice] = 'Produto criado com sucesso'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    Produto.destroy params[:id]
    redirect_to root_url
  end

  def busca
    @nome = Produto.where('nome like ?', "%#{params[:nome]}%")
  end

  private

  def produto_params
    params.require(:produto).permit(:nome, :cor, :preco, :quantidade)
  end
end
