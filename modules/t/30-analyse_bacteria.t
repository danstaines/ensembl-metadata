# Copyright [2009-2014] EMBL-European Bioinformatics Institute
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use strict;
use warnings;
use Data::Dumper;
use Test::More;
use Bio::EnsEMBL::Test::MultiTestDB;
use Bio::EnsEMBL::MetaData::MetaDataProcessor;
use Bio::EnsEMBL::MetaData::AnnotationAnalyzer;
use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init($INFO);

my $test = Bio::EnsEMBL::Test::MultiTestDB->new('campylobacter_jejuni');
my $core = $test->get_DBAdaptor('core');

my $gdba = Bio::EnsEMBL::Test::MultiTestDB->new('multi')->get_DBAdaptor('empty_metadata');
my $processor = Bio::EnsEMBL::MetaData::MetaDataProcessor->new(
   -ANNOTATION_ANALYZER => Bio::EnsEMBL::MetaData::AnnotationAnalyzer->new(),
   -INFO_ADAPTOR => $gdba
);


my $details = $processor->process_metadata([$core]);
ok( defined $details, "Metadata exists" );
done_testing;
