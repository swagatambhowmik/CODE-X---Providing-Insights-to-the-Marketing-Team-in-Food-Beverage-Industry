use codex_db;
select * from cities;
select * from fact_survey_responses;
select * from respondents_data;

-- DEMOGRAPHIC INSIGHTS
--1) who prefers energy drink more? (male/female/non-binary)
select * from respondents_data;

select gender, count(1) as gender_cnt
from respondents_data
group by gender;
/* males prefer energy drink most as compared to females and non-binary. CODE X can target the males gender
by bringing out various targeting ads in gyms, bodybuilding websites, etcs.
*/

--2) which age group prefers energy drink more?
select age, count(1) as energy_drink_consumed_cnt
from respondents_data
group by  age;
/*
people in the age group of 19-30 consume the most energy drink
*/
--3) which type of marketing reaches the most youth (15-30)?
select fc.marketing_channels, count(1) as marketing_channel_cnt
from fact_survey_responses fc
inner join respondents_data rd on fc.respondent_id=rd.respondent_id
where age >= '15' and age <='30'
group by marketing_channels
order by marketing_channel_cnt desc;
/* online ads marketing channel reaches the most youth in the age range 15-30 as people in this age range
spend most of the time scolling through mobile devices. CODE X can dedicate most of their marketing
resources on online ads as though it CODE X can advertise their product to its largest consuner base.
*/

-- CONSUMER PREFERENCES
--4) What are the preferred ingredients of energy drinks among respondents?
select * from fact_survey_responses;

select ingredients_expected, count(1) as preference_cnt
from fact_survey_responses
group by ingredients_expected
order by preference_cnt desc;
-- the most preferred ingredient is caffeine followed by vitamins, sugar, and guarana.

--5) What packaging preferences do respondents have for energy drinks?
select packaging_preference, count(1) as packaging_preference_cnt
from fact_survey_responses
group by packaging_preference
order by packaging_preference_cnt desc;
/* Compact and portable cans is the most preferred packaging followed by Innovative bottle design,
Collectible packaging, Eco-friendly design, and other.
*/

--limited edition packaging -- preference response
select limited_edition_packaging, count(1) as limited_edition_packaging_cnt
from fact_survey_responses
group by limited_edition_packaging
order by limited_edition_packaging_cnt desc
/* from this we can say that customers have mostly liked the new energy drink and does not want it to be
a limited edition energy drink. This provides a meaningful response that the CODE X energy drink has
successfully planted itself as a preferred energy drink in the Indian market.
*/

-- which price range does the customers preferred the most?
select price_range, count(1) as price_range_cnt
from fact_survey_responses
group by  price_range
order by price_range_cnt desc;
/* it shows that customers preferred CODE X energy drink in the price range between 50-99, followed by
100 - 150. Also we can see that customers least prefer the price range to be below 50.
That shows that customers prefer CODE X to be a premium energy drink in the market that provides them
a perception of higher quality, exclusivity, and a sense of status.
*/

-- does price range have any relationship to purchase location
select purchase_location, price_range, count(1) as purchase_loc_price_range_cnt
from fact_survey_responses
group by purchase_location, price_range
order by purchase_location, purchase_loc_price_range_cnt desc;

--does customers prefer the narutal or organic flavour?
select interest_in_natural_or_organic, count(1) as interest_in_natural_or_organic_cnt
from fact_survey_responses
group by interest_in_natural_or_organic
/* this shows that customers prefer the interest_in_natural_or_organic most.
*/

-- how many customers believe that CODE X has health concers or not?
select health_concerns, count(1) as health_concerns_cnt
from fact_survey_responses
group by health_concerns
order by health_concerns_cnt desc;
/* most of the customers believe that the CODE X energy drink has health concerns. From the early
customer sentiment analysis, CODE X can formulate various ad campaings that shows the ture benefits of
the drink and thereby redeuce customers perception that the energy drink may cause health concerns.
*/

-- which improvements were the most desired by the customers?
select improvements_desired, count(1) as improvements_desired_cnt
from fact_survey_responses
group by improvements_desired
order by improvements_desired_cnt desc;
/* most customers have voted to reduce the sugar content in the CODE X energy drink and also to increase
more natural ingredients for the CODE X energy drink. This means that customers believe that the CODE X
energy drink have more sugar content and less natural ingredients, which can cause health concers. This is
the reason why most customer have voted yes to health concerns reason for the CODE X energy drink.
*/

-- which are the current competition brands present in the market?
select distinct current_brands
from fact_survey_responses;

-- what are some of the popular reasons for customers chooing other brands?
select reasons_for_choosing_brands, count(1) as reasons_for_choosing_brands_cnt
from fact_survey_responses
group by reasons_for_choosing_brands
order by reasons_for_choosing_brands_cnt desc;
/* it was seen that customers preferred brand reputation more than avaiability for choosing other brands,
followed by Taste/flavor preference. CODE X can build a better brand reputation by constatntly developing
a strong brand identity, consistently delivering high-quality products, actively engaging with the customers,
utilizing authentic cutomer reviews to adapt the products offered and respond promptly to any customer
concerns, leveraging influencer marketing, etc.
*/
-- how brand perception influenced the taste experience of the consumers?
select brand_perception, count(1) as brand_perception_cnt
from fact_survey_responses
group by brand_perception;
/* from this we can say that majority of customers have shown neutral brand perception and a good amount of
customers have shown positive brand perception. Combining both these brand perceptions, we can say that
CODE X has garnered positive brand perception in the Indian market which can benefit them to position their
product against exisiting competitiors.
*/

-- what are the popular reasons customers have put forth for not trying?
select reasons_preventing_trying, count(1) as reasons_preventing_trying_cnt
from fact_survey_responses
group by reasons_preventing_trying
order by reasons_preventing_trying_cnt desc;
/* from this we can see that the popular reasons preventing customers from not trying the CODE X energy drink
are mostly not available locally and health concerns. CODE X can address these issues by taking strategic
business decisions such as -
	1) CODE X can identify the local city centres ans other gathering spcaes and either open new outlets
	or partner with local kirana shops where customers regularly visit and provide dedicated kiosks.
	2) CODE X can address the health concern reasons by dedicatedly providing nutuitional benefits and other
	organic ingredients that they are using while making the energy drinks. Also utilizing influencer
	marketing strategies they can generate positive health benefits awareness among customers.
*/
-- which are the typical consumption situations that are popular for consuming CODE X by consumers?
select typical_consumption_situations, count(1) as typical_consumption_situations_cnt
from fact_survey_responses
group by typical_consumption_situations
order by typical_consumption_situations_cnt desc;
/* the most popular consumption situations are Sports/exercise followed by Studying/working late and then
Social outings/parties. From this CODE X management can make strategic business decision to partner with
gyms and sporting clubs to provide exclusive energy drinks and other beverages to athleats. CODE X can also
run ads that target gym going persons and also sport athleats which can drive sales.

CODE X can also make targeted ads that target students and working professionals who are working late and
can use CODE X energy drink as energy booster purpose.

Another typical consumtion situation is Social outings/parties where CODE X can market itself as energy booster
and party drink that party goers can also drink.
*/

-- COMPETITION ANALYSIS
-- who are the current market leaders?
select current_brands, count(1) as current_brand_preference_cnt
from fact_survey_responses
group by current_brands
order by current_brand_preference_cnt desc;
/* 
currently Cola-Coka is the market leader in the energy drink business, followed by Bepsi and then Gangster.
These are the top 3 energy drink brands currenly present in the market. CODE X comes at 5th rank.
*/

-- What are the primary reasons consumers prefer those brands over ours?
select reasons_for_choosing_brands, count(1) as reasons_for_choosing_brands_cnt
from fact_survey_responses
group by reasons_for_choosing_brands
order by reasons_for_choosing_brands_cnt desc;
/*
the primary reasons consumer prefers those brands over CODE X are brand reputation, Taste/flavor preference,
Availability, Effectiveness, Other. For CODEX to become a preferred choise for consumers, the management
can make strategic business decisions like -
	1) constantly delivering high quality products in this case high quality energy drink CODE X with best
	neutirents and organic factors, reduced sugar content, etc.
	2) prioritizing excellent customer service by having high rate of product availability and also providing
	exchange benefits to the customer.
	3) actively managing customer reviews and feedbacks and providing constant product development information
	to the customers.
*/

-- BRAND PENETRATION
-- What do people think about our brand? (overall rating)
select brand_perception, count(1) as brand_perception_cnt
from fact_survey_responses
group by brand_perception
order by brand_perception_cnt desc;

-- Which cities do we need to focus more on?
select city_name, count(1) as response_cnt
from respondents_data rd
inner join cities c on rd.city_id=c.city_id
group by city_name
order by response_cnt desc;
/*
the top 3 cities that has the highest response counts are - Bangalore, Hyderabad, and Mumbai. Most of the
customers from these 3 cities have responded, which means they have tried the CODE X energy drink and
the energy drink has significant market visibility in these 3 cities. So CODE X can launch their product
at mass quantity by focusing first in these 3 cities.
*/

with cte as (select *, row_number() over(partition by age order by customer_cnt desc) as rn
from
(select age, city_name, count(1) as customer_cnt
from respondents_data rd
inner join cities c on rd.city_id=c.city_id
inner join fact_survey_responses f on f.respondent_id=rd.respondent_id
group by age, city_name) as a)

select age, city_name, customer_cnt
from cte
where rn=1;
/* for every age group, Bangalore city has the most customer count. Banagalore city has the most number of
customers who have provided response in every age group, thus it shows that CODE X has the maximum market
visibility in this city across every age group. CODE X can focus on mass launching their flagship product
in Bangalore first.
*/






