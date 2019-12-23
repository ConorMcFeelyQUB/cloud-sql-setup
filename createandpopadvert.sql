CREATE DATABASE cloudcomputingadverts;

USE cloudcomputingadverts;

CREATE TABLE advert (
  advertid bigint(20) UNSIGNED NOT NULL,
  keyword varchar(254) NOT NULL,
  advert text NOT NULL,
  url varchar(2048)
);

ALTER TABLE advert
  ADD PRIMARY KEY (advertid);
  
ALTER TABLE advert
  MODIFY advertid bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
  
INSERT INTO advert (advertid, keyword, advert, url) VALUES
(1, 'network', 'Bob\'s networks are the best networks in all the world. Buy Bob\'s for the best networks!', '#'),
(2, 'monitoring', 'Network monitoring is difficult. Why not let the ropiest network monitor do it all for you, well at least until it fails and itself catches fire. FreeNATS - network monitoring you definitely can\'t trust.', '#');
