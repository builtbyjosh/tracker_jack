class Child < ActiveRecord::Base
    belongs_to :parent
    has_many :appointment
    has_many :milestones

    def slug
        name.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        Child.all.find{|name| name.slug == slug}
    end
end
