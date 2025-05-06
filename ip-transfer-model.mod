#PARAMETER
param num_hospital integer;				# number of hospital (N)
param num_group_patient integer;		# number of group patient (G)
param num_bed_type integer;				# number of bed type (B)
param num_time_period integer;			# number of time periode (T)

#SET/INDEKS
set N := 1 .. num_hospital;				# set of hospital (i,j)
set G := 1 .. num_group_patient;		# set of group patient (g)
set B := 1 .. num_bed_type;			 	# set of bed type (b)
set T := 0 .. num_time_period;			# set of time-period (t)

#PARAMETER(1)
param patients_admitted {B, N, T};		# total patient (p_git)
param total_bed {B, N};					# total bed (b_bi)
param length_stay_patients {G};			# length stay patients (l_g)
param patients_discharged {B, N, T};	# patients who were discharged (d_git)
param total_patient_transfermx;
param patient {B, N, T};

#VARIABEL
var allocated {b in B, i in N, j in N, t in T} >= 0 integer;	# number of patients allocated from node i to node j in time period t (s_gijt)
																# Jumlah pasien kelompok g yang dialokasikan dari rumah sakit i ke j pada waktu t
var overflow {b in B, i in N, t in T} >= 0 integer;				# the upper limit on bed type beta in hospital i at time t (omega_bit)
var patients_active {b in B, i in N, t in T} >= 0 integer;		# active patients (a_git)
var patients_entering {b in B, i in N, t in T} >= 0 integer;	# patients entering (x_git)
var patients_leaving {b in B, i in N, t in T} >= 0 integer;		# patients leaving (y_git)

#OBJECTIVE FUNCTION
minimize Z: sum{b in B} sum{i in N} sum{t in T} overflow[b,i,t]; 

#CONSTRAINT
subj to con3b {b in B, i in N, t in T}:
	sum{j in N} allocated[b,i,j,t] <= patients_admitted[b,i,t];

subj to con3c {b in B, i in N, j in N, t in T}:
	patient[b,i,t] - total_bed[b,i] <= overflow[b,i,t];

subj to con3d {b in B, i in N, t in T}:
	patients_active[b,i,t] = patient[b,i,t] + sum{u in T diff {0}} (patients_entering[b,i,u] - patients_discharged[b,i,u]);

subj to con3e {b in B, i in N, t in T}:
	patients_entering[b,i,t] = patients_admitted[b,i,t] + sum{j in N} (allocated[b,j,i,t] - allocated[b,i,j,t]);

subj to con3g {b in B, i in N, j in N, t in T: i = j}:
	allocated[b,i,j,t] = 0;

subj to con3h1 {b in B, i in N, j in N, t in T}:
	allocated[b,i,j,t] >= 0;

subj to con3h2 {b in B, i in N, j in N, t in T}:
	overflow[b,i,t] >= 0;

