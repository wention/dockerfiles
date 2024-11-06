FROM haishanh/yacd AS ui
FROM dreamacro/clash AS clash

FROM alpine

COPY --from=ui /usr/share/nginx/html /ui
COPY --from=clash /clash /clash

CMD ["/clash"]
