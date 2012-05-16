class CocktailsController < ApplicationController
  before_filter :validateAuth, :except => [:index,:oficiales,:megusta,:nomegusta]
  # GET /cocktails
  # GET /cocktails.json
  def index
    @cocktails = Cocktail.where("oficial = ?", false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cocktails }
    end
  end

  # GET /cocktails/1
  # GET /cocktails/1.json
  def show
    @cocktail = Cocktail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @cocktail }
    end
  end

  # GET /cocktails/new
  # GET /cocktails/new.json
  def new
    @cocktail = Cocktail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @cocktail }
    end
  end

  # GET /cocktails/1/edit
  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    
    
    @cocktail = Cocktail.new(params[:cocktail])
    @cocktail.prise = 20000
    @cocktail.grade = 0
    @cocktail.oficial = false
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, :notice => 'Cocktail was successfully created.' }
        format.json { render :json => @cocktail, :status => :created, :location => @cocktail }
      else
        format.html { render :action => "new" }
        format.json { render :json => @cocktail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cocktails/1
  # PUT /cocktails/1.json
  def update
    @cocktail = Cocktail.find(params[:id])
    respond_to do |format|
      if @cocktail.update_attributes(params[:cocktail])
        format.html { redirect_to @cocktail, :notice => 'Cocktail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @cocktail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cocktails/1
  # DELETE /cocktails/1.json
  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    respond_to do |format|
      format.html { redirect_to cocktails_url }
      format.json { head :no_content }
    end
  end
  def oficiales
    @cocktails = Cocktail.where("oficial = ?", true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cocktails }
    end
  end
  def megusta
    @cocktail = Cocktail.find(params[:id])
    
    @ultimos=Cocktail.where("oficial = ?",true).order("grade desc").limit(10)
    @ultimo=@ultimos[9]
    if(!@ultimo.nil? && @ultimo.grade == @cocktail.grade && @cocktail.oficial == false)
      @cocktail.oficial=true
      @ultimo.oficial=false
      @ultimo.save
    
    end
    if(@ultimo.nil? && @cocktail.grade >= 2)
      @cocktail.oficial=true
    end
    @cocktail.grade=@cocktail.grade+1
    @cocktail.save
    redirect_to cocktails_path
  end
  def nomegusta
    @cocktail = Cocktail.find(params[:id])
    
    @primero=Cocktail.where("oficial = ?",false).order("grade desc").limit(10).first()
    if(!@primero.nil? && @primero.grade == @cocktail.grade && @cocktail.oficial == true)
      @cocktail.oficial=false
      @primero.oficial=true
      @primero.save
    end
    if(@primero.nil? && @cocktail.grade = 2)
      @primero.oficial=false
    end
    @cocktail.grade=@cocktail.grade-1
    @cocktail.save
    redirect_to cocktails_path
  end
end
