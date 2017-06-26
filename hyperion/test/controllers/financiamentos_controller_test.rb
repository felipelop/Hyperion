require 'test_helper'

class FinanciamentosControllerTest < ActionController::TestCase
  setup do
    @financiamento = financiamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financiamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financiamento" do
    assert_difference('Financiamento.count') do
      post :create, financiamento: { cliente_id: @financiamento.cliente_id, entrada: @financiamento.entrada, imovel_id: @financiamento.imovel_id, juros: @financiamento.juros, parcela: @financiamento.parcela, status: @financiamento.status, subsidio: @financiamento.subsidio }
    end

    assert_redirected_to financiamento_path(assigns(:financiamento))
  end

  test "should show financiamento" do
    get :show, id: @financiamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @financiamento
    assert_response :success
  end

  test "should update financiamento" do
    patch :update, id: @financiamento, financiamento: { cliente_id: @financiamento.cliente_id, entrada: @financiamento.entrada, imovel_id: @financiamento.imovel_id, juros: @financiamento.juros, parcela: @financiamento.parcela, status: @financiamento.status, subsidio: @financiamento.subsidio }
    assert_redirected_to financiamento_path(assigns(:financiamento))
  end

  test "should destroy financiamento" do
    assert_difference('Financiamento.count', -1) do
      delete :destroy, id: @financiamento
    end

    assert_redirected_to financiamentos_path
  end
end
