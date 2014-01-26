class InfoController < ApplicationController
  def about
  	@breadcrumb="Sobre o Blogs de Mãe"
  	@blog = Blog.find(123)#where(name='Blogs de Mãe').take #deve haver um jeito melhor
  		
  	@authors = @blog.authors
  end

  def terms
  	@breadcrumb="Termos de Uso"
  end
  
  def privacy
  	@breadcrumb="Política de Privacidade"
  end

  def contact
  	@breadcrumb="Contato"
  end
end
