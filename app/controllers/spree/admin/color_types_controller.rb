module Spree
  module Admin
    class ColorTypesController < ResourceController
      before_action :setup_new_color_value, only: :edit

      def update_values_positions
        params[:positions].each do |id, index|
          ColorValue.where(:id => id).update_all(:position => index)
        end

        respond_to do |format|
          format.html { redirect_to admin_product_variants_url(params[:product_id]) }
          format.js { render :text => 'Ok' }
        end
      end

      protected

        def location_after_save
          if @color_type.created_at == @color_type.updated_at
            edit_admin_color_type_url(@color_type)
          else
            admin_color_types_url
          end
        end

      private
        def load_product
          @product = Product.find_by_param!(params[:product_id])
        end

        def setup_new_color_value
          @color_type.color_values.build if @color_type.color_values.empty?
        end

        def set_available_color_types
          @available_color_types = if @product.color_type_ids.any?
            ColorType.where('id NOT IN (?)', @product.color_type_ids)
          else
            ColorType.all
          end
        end

    end
  end
end