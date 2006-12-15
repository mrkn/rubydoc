require digest

= class Digest::SHA256 < Digest::Base

FIPS PUB 180-2�˵��Ҥ���Ƥ���NIST (the US' National Institute of
Standards and Technology) �� SHA-256 Secure Hash Algorithm��
�������륯�饹��


= class Digest::SHA384 < Digest::Base

FIPS PUB 180-2�˵��Ҥ���Ƥ���NIST (the US' National Institute of
Standards and Technology) �� SHA-384 Secure Hash Algorithm��
�������륯�饹��


= class Digest::SHA512 < Digest::Base

FIPS PUB 180-2�˵��Ҥ���Ƥ���NIST (the US' National Institute of
Standards and Technology) �� SHA-512 Secure Hash Algorithm��
�������륯�饹��

#@since 1.8.6
= class Digest::SHA2 < Digest::Class
== Class Methods
--- new(bitlen = 256)
Creates a new SHA2 hash object with a given bit length.
#@end
