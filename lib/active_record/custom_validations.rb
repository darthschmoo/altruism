module ActiveRecord
  module CustomValidations
    def validates_temporal_sanity( *args )
      configuration = { :future => false, :message => "must start before it ends", :future_message => "must be in the future"}
      configuration.update(args.extract_options!)
      validates_on = (configuration[:on] || :save)

      send(validates_on) do |record|
        starts, ends = args.map{ |col| record.send(col) }
        if starts >= ends
          record.errors.add(args[0], configuration[:message])
        end
      end
    end
  end
end

ActiveRecord::Base.extend( ActiveRecord::CustomValidations )
