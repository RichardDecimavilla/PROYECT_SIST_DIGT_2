library ieee;
use ieee.std_logic_1164.all;

entity mss1 is
      port(clock, resetn, cargar, comp0,comp1,comp2: in  std_logic;
		     a0, b0, w0,a1,b1,w1,a2,b2,switch: out std_logic);
end mss1;

architecture funcion1 of mss1 is
       type estado is (t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,tw,tx,ty,tz);
		 signal y: estado;
		 
		 begin
		 --Estados siguientes
		 process (clock, resetn)
		 begin
		 if resetn='0' then y<=t1;
		 elsif (clock'event and clock='1') then
		     case y is
			      when t1=>
					   if cargar = '1' then y<=t2;
						else y<=t1; end if;
				   when t2=>
					   if cargar = '0' then y<=t3;
						else y<=t2; end if;
					when t3=>y<=t4;
					when t4=>y<=t5;
					when t5=>
					   if comp0 = '0' then y<=t6;
						else y<=t7; end if;
					when t6=>y<=t4;
					when t7=>y<=t8;
					when t8=>y<=t9;
					when t9=>y<=t10;
					when t10=>
					   if comp2 = '1' then y<=t11;
						else y<=t13; end if;
					when t11=>y<=t12;
					when t12=>y<=t13;
					when t13=>y<=t14;
					when t14=>
					   if comp0 = '0' then y<=t9;
						else y<=t15; end if;
					when t15=>y<=t16;
					when t16=>y<=t17;
					when t17=>y<=t18;
					when t18=>
					   if comp1 = '0' then y<=t19;
						else y<=tw; end if;
					when t19=>y<=t9;
					when tw=>y<=tx;	
					when tx=>y<=ty;
					when ty=>
					   if comp1 = '0' then y<=tz;
						else y<=t1; end if;
					when tz=>y<=tx;
				end case;
			end if;
		end process;
	--salidas
   process (y, cargar, comp0)	
   begin
	A0<='0'; B0<='0';W0<='0';A1<='0'; B1<='0';W1<='0';A2<='0'; B2<='0';switch<='0';
	     case y is
		    when t1=> switch<='1';
			 when t2=> A0<='1'; B0<='1';
			 when t3=>  
			 when t4=> W0<='1'; A0<='1'; 
			 when t5=>
			 when t6=> 
			 when t7=> A0<='1'; B0<='1';A1<='1'; B1<='1';A2<='1'; B2<='1';
			 when t8=>
			 when t9=> 
			 when t10=>
			 when t11=> A2<='1';
			 when t12=>
			 when t13=> A0<='1';
			 when t14=> 
			 when t15=> 
			 when t16=> W1<='1';
			 when t17=> A0<='1'; B0<='1';A1<='1';A2<='1'; B2<='1';
			 when t18=>
			 when t19=>
          when tw=> A1<='1'; B1<='1';
			 when tx=>
			 when ty=>
			 when tz=> A1<='1';
		  
	end case;
   end process;
end funcion1;	
			 