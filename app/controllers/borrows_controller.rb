class BorrowsController < ApplicationController
  # GET /borrows
  # GET /borrows.xml
  def index
    @borrows = Borrow.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @borrows }
    end
  end

  # GET /borrows/1
  # GET /borrows/1.xml
  def show
    @borrow = Borrow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @borrow }
    end
  end

  # GET /borrows/new
  # GET /borrows/new.xml
  def new
    @borrow = Borrow.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @borrow }
    end
  end

  # GET /borrows/1/edit
  def edit
    @borrow = Borrow.find(params[:id])
  end

  # POST /borrows
  # POST /borrows.xml
  def create
    @borrow = Borrow.new(params[:borrow])

    respond_to do |format|
      if @borrow.save
        format.html { redirect_to(@borrow, :notice => 'Borrow was successfully created.') }
        format.xml  { render :xml => @borrow, :status => :created, :location => @borrow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @borrow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /borrows/1
  # PUT /borrows/1.xml
  def update
    @borrow = Borrow.find(params[:id])

    respond_to do |format|
      if @borrow.update_attributes(params[:borrow])
        format.html { redirect_to(@borrow, :notice => 'Borrow was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @borrow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /borrows/1
  # DELETE /borrows/1.xml
  def destroy
    @borrow = Borrow.find(params[:id])
    @borrow.destroy

    respond_to do |format|
      format.html { redirect_to(borrows_url) }
      format.xml  { head :ok }
    end
  end
end
