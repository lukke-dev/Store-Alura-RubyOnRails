class ProdutosController < ApplicationController
  def index
    @produtos = Produto.order(nome: :desc).limit 5
    @prod_desc = Produto.order(:preco).limit(1)
  end

  def new; end

  def create
    Produto.create(produto_params)
    redirect_to root_path
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
