require 'facter'
Facter.add(:epel_installed) do
  confine :osfamily => %w{RedHat}
  setcode do
    rpm = %x{rpm -qa | grep epel-release}.chomp
    if rpm !~ /epel-release/
      output = false
    else
      output = true
    end
    output
  end
end
