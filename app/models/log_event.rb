class LogEvent < ActiveRecord::Base
  enum status:   [ :Updated, :Installed, :Removed ]
  enum platform: [ :noarch, :x86_64, :i686, :unknown ]
  
  # accossiations
  belongs_to :user,   :foreign_key => 'user_id'
  belongs_to :log_file,   :foreign_key => 'logfile_id'
  
  # validations
  validates :install_date, presence: true, if: :is_datetime?
  validates :status, presence: true, inclusion: { in: %w(Updated Installed Removed), message: "%{status} is not a valid status" }
  validates :package_name, presence: true, length: { maximum: 255 }
  validates :major_rel, presence: true
  validates :minor_rel, presence: true
  validates :elxxx, length: { maximum: 255 }
  validates :platform, presence: true, inclusion: { in: %w(noarch x86_64 i686 unknown), message: "%{platform} is not a valid platform" }
  validates :user_id, presence: true
  validates :log_file_id, presence: true
  
  private

    # check If datetime is correct
    def is_datetime?
      if !install_date.to_datetime.is_a?(DateTime)
        errors.add(:install_date, 'must be a valid datetime') 
      end
    end
  
end
