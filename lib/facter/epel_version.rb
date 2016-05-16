require 'facter'
Facter.add(:epel_version) do
  confine :osfamily => %w{RedHat}
  setcode do
    osr = Facter.value(:operatingsystemrelease)
    output = osr[0,1]
    output
  end
end
