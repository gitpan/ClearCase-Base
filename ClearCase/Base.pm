package ClearCase::Base;
 
# [Class Variables]

our $VERSION = '0.01';

# [Modules]

use strict;

# [Constructor]

sub new 
{
 my $proto  		= shift;
 my $class  		= ref($proto) || $proto;
 my $self   		= {};
 my @extras  		= @_;

 my ($key,$value,$extra);
 
 if(length(@extras) > 0)
 {
  foreach $extra (@extras)
  {
   ($key,$value) = split(/=>/,$extra);
   #print "Defined KEY: $key with value $value\n";
   $self->{$key} = $value;
  } 
 } 
 
 # [Instance Variables]
 
 $self->{DEBUG} = 0 unless(defined($self->{DEBUG}));
 
 bless ($self, $class);
 return $self;
}

# [Methods]

sub Exception
{
 my $self	= shift;
 my $eNumber	= shift;
 my $eText	= {
 		   100=>['FATAL','Generic Fatal Error.']
 		  ,101=>['FATAL','Method not implemented for this type.']
 		  ,102=>['FATAL','CtExecution of lsvob fails.']
 		  ,103=>['FATAL','CtExecution of describe fails.']
 		  ,104=>['FATAL','CtExecution of lsregion fails.']
 		  ,105=>['FATAL','Unalthorized User.']
 		  ,106=>['FATAL','CtExecution of lstype fails.']
 		  ,501=>['WARN','Debug mode is ON']
  		  };
  
 print "[".scalar(localtime)."] [$eText->{$eNumber}[0] $eNumber] $eText->{$eNumber}[1]\n";
 die if($eNumber < 500);
}
 
# [Class Tail]
return 1;