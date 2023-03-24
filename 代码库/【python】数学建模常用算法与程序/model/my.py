def _getStartingVals(self):
    if self._data is not None:
        if self._include_constant:
            c = 'c'
        else:
            c = 'nc'
        try:
            # statsmodels.tsa.arima_model.ARMA has been discontinued and replaced with statsmodels.tsa.arima.model.ARIMA, just force d=0 to make it an ARMA
            arma = ARIMA(self._data.values, order=(self._order['AR'],0,self._order['MA']), trend=c)
            model = arma.fit()
            # the original and now-deprecated statsmodels.tsa.arima_model.ARMA function does NOT include sigma2 in its params when returning the fitted results, so filter it out
            self._startingValues = [param for param,name in zip(model.params,arma.param_names) if name!='sigma2']
        except ValueError:
            self._startingValues = None
    else:
        self._startingValues = np.zeros((self._pnum,))+0.5
