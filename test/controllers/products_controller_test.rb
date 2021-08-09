require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
    # My turn
    @price = 0.01
    @image_url = "ruby.jpg"
    @description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."

  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_product_url
  #   assert_response :success
  # end

  test "should create product" do
    assert_difference('Product.count') do
      # post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
      post products_url, params: { product: { description: @description, image_url: @image_url, price: @price, title: @title } }
    end

    assert_redirected_to product_url(Product.last)
  end

  # test "should show product" do
  #   get product_url(@product)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_product_url(@product)
  #   assert_response :success
  # end

  test "should update product" do
    # patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
    patch product_url(@product), params: { product: { description: @description, image_url: @image_url, price: @price, title: @title } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end

def create
  @product = Product.new(product_params)
  
  respond_to do |format|
    if @product.save
      format.html { redirect_to @product,
        notice: 'Product was successfully created.' }
      format.json { render :show, status: :created,
        location: @product }
    else
      puts @product.errors.full_messages
      format.html { render :new }
      format.json { render json: @product.errors,
        status: :unprocessable_entity }
    end
  end
end