byWho="CronJob"
CID=`date '+%m%d%y%H%M'`
for partner in $(curl "https://venuerpil-stage.ccp.xcal.tv:10652/venuerpil/partners?source=hms&requestedBy=$byWho&cid=$CID" |awk 'NR > 1 {print $1}' RS='[' FS=']' |sed "s/,/ /g" | tr -d '"')
do
	echo "Working on partner id : $partner"
	CID=`date '+%m%d%y%H%M'`

	curl  -vv -X PUT  "https://venuerpil-stage.ccp.xcal.tv:10652/venuerpil/partner/devices/xapistatus?partnerCode=$partner&requestedBy=$byWho&cid=$CID"
	
	
done

