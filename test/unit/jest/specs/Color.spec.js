import Color from '@/components/Color.coffee'

describe('Color.coffee', () => {
  it('sets the correct default data', () => {
    expect(typeof Color.methods).toEqual('object')
  })

  it('has a method: color', () => {
    expect(typeof Color.methods.color).toEqual('function')
  })

  it('color method returns correct function: hex', () => {
    expect(typeof Color.methods.color().hex).toEqual('function')
    expect(Color.methods.color('red').hex()).toEqual('#ff6384')
  })

  it('color method returns correct function: rgb', () => {
    expect(typeof Color.methods.color().rgb).toEqual('function')
    expect(Color.methods.color('red').rgb()).toEqual('rgb(255,99,132)')
  })

  it('color method returns correct function: rgba', () => {
    expect(typeof Color.methods.color().rgba).toEqual('function')
    expect(Color.methods.color('red').rgba()).toEqual('rgba(255,99,132,0.5)')
    expect(Color.methods.color('red').rgba('.3')).toEqual('rgba(255,99,132,.3)')
    expect(Color.methods.color('red').rgba(0.3)).toEqual('rgba(255,99,132,0.3)')
  })
})
