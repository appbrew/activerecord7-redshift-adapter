# frozen_string_literal: true

module ActiveRecord
  module ConnectionAdapters
    class RedshiftColumn < Column # :nodoc:
      delegate :oid, :fmod, to: :sql_type_metadata

      # Required for Rails 6.1, see https://github.com/rails/rails/pull/41756
      mattr_reader :array, default: false
      alias array? array

      # identity, generated column type is not supported by Redshift (PostgreSQL 8.0.2)
      def initialize(*, **)
        super
      end
    end
  end
end
