import Vue from 'vue'
import Color from '@/components/Color.coffee'

describe('Color.coffee', () ->
    it('sets the correct default data', () ->
        expect(typeof Color.methods).to.equal('object')
    )
    it('has a method: color', () ->
        expect(typeof Color.methods.color).to.equal('function')
    )
    it('color method returns correct function: hex', () ->
        expect(typeof Color.methods.color().hex).to.equal('function')
        expect(Color.methods.color('red').hex()).to.equal('#ff6384')
    )
    it('color method returns correct function: rgb', () ->
        expect(typeof Color.methods.color().rgb).to.equal('function')
        expect(Color.methods.color('red').rgb()).to.equal('rgb(255,99,132)')
    )
    it('color method returns correct function: rgba', () ->
        expect(typeof Color.methods.color().rgba).to.equal('function')
        expect(Color.methods.color('red').rgba()).to.equal('rgba(255,99,132,0.5)')
        expect(Color.methods.color('red').rgba('.3')).to.equal('rgba(255,99,132,.3)')
        expect(Color.methods.color('red').rgba(0.3)).to.equal('rgba(255,99,132,0.3)')
    )
)
