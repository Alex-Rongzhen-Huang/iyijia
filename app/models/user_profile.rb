# encoding: UTF-8

class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :avatar, :gender, :location, :mobile, :nickname
  attr_accessible :user_id

  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader

  LOCATIONS =  %w[浦东 嘉定 闵行 宝山 青浦 松江 普陀 徐汇 杨浦 虹口 闸北 奉贤 金山 黄浦 静安 卢湾 崇明 长宁 昆山 吴江 嘉兴 其他]
end
