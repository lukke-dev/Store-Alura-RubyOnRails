class ProdutosController < ApplicationController
  before_action :set_product, only: %i[update edit]
  before_action :set_department, only: %i[update create new edit]
  def index
    @produtos = Produto.order(nome: :desc).limit 5
    @prod_desc = Produto.order(:preco).limit(1)
  end

  def new
    @produto = Produto.new
  end

  def edit; end

  def create
    @produto = Produto.new(produto_params)
    if @produto.save
      flash[:notice] = 'Produto criado com sucesso'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @produto.update(produto_params)
      flash[:notice] = 'Produto atualizado com sucesso!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Produto.destroy params[:id]
    redirect_to root_url
  end

  def show
    @nome = Produto.where('nome like ?', "%#{params[:nome]}%")
  end

  private

  def set_product
    @produto = Produto.find(params[:id])
  end

  def set_department
    @dep = Departamento.all
  end

  def produto_params
    params.require(:produto).permit(:nome, :cor, :preco, :quantidade, :departamento_id)
  end
end
