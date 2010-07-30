require 'spec_helper'

describe WidgetsController do

  describe 'GET index' do
    before(:each) do
      @widgets = [mock_model(Widget)]
      Widget.should_receive(:all).and_return(@widgets)    
    end
    
    it 'should be successful' do
      get :index
      response.should be_successful
    end
    
    # it 'should be successful with a json request' do
    #   request.env["HTTP_ACCEPT"] = "application/json"
    #   get :index, :format => 'json'      
    #   response.should be_successful
    # end    
  end
  
  
  describe 'GET show' do
    it 'should be successful' do
      @widget = mock_model(Widget)
      Widget.should_receive(:find).and_return(@widget)
      get :show, :id => 1
      response.should be_successful
    end
    
    it 'should be successful with json'
  end
  

  describe 'GET new' do
    it 'should be successful' do
      @widget = mock_model(Widget)
      Widget.should_receive(:new).and_return(@widget)
      get :new
      response.should be_successful
    end
  end
  
  describe 'POST create' do
    before(:each) do
      @widget = mock_model(Widget, :save => true)
      Widget.should_receive(:new).and_return(@widget)      
    end
    
    it 'should be successful' do
      @widget.should_receive(:save)
      post :create, :widget => @widget      
      flash[:notice].should == 'Successfully created widget.'
    end
    
    it 'should not be successful' do
      @widget.should_receive(:save).and_return(false)      
      post :create, :widget => @widget
      flash[:notice].should_not == 'Successfully created widget.'
    end
    
    
  end
  
  
  describe 'GET edit' do
    it 'should be successful' do
      @widget = mock_model(Widget)
      Widget.should_receive(:find).and_return(@widget)
      get :edit, :id => 1
      response.should be_successful
    end
    
  end
  
  describe 'PUT update' do
    before(:each) do
      @widget = mock_model(Widget, :update_attributes => true)
      Widget.should_receive(:find).and_return(@widget)      
    end
    
    it 'should be successful' do
      @widget.should_receive(:update_attributes)
      put :update, :id => 1,  :widget => @widget      
      flash[:notice].should == 'Successfully updated widget.'
    end
    
    it 'should not be successful' do
      @widget.should_receive(:update_attributes).and_return(false)      
      put :update, :id => 1, :widget => @widget
      flash[:notice].should_not == 'Successfully updated widget.'
    end
    
    
    
  end
  
  # 
  describe 'DELETE destroy' do
    it 'should be successful' do
      @widget = mock_model(Widget, :destroy => true)
      Widget.should_receive(:find).and_return(@widget)      
      delete :destroy, :id => 1
      flash[:notice].should == 'Successfully removed widget.'
    end
    
  end
  

end
