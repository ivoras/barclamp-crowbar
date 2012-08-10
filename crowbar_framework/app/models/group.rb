# Copyright 2012, Dell
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Group < ActiveRecord::Base
  
  attr_accessible :name, :description, :category, :order

  validates_uniqueness_of :name, :message => I18n.t("db.notunique", :default=>"Name item must be unique")
  validates_format_of :name, :with=>/[a-zA-Z][_a-zA-Z0-9]/, :message => I18n.t("db.lettersnumbers", :default=>"Name limited to [_a-zA-Z0-9]")

  validates_inclusion_of :category, :in => %w( ui ), :message => "Group Model Validation Error: type %s is not an allowed category"

  has_many :node_groups
  has_many :nodes, :through => :node_groups, :order=>"[order], [name] ASC"

end
